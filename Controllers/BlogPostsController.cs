using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ChemSolution.Data;
using ChemSolution.Models;
using ChemSolution.Services;
using Microsoft.AspNetCore.Authorization;

namespace ChemSolution.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BlogPostsController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly CheckFieldService _checkField;

        public BlogPostsController(DataContext context, CheckFieldService checkField)
        {
            _checkField = checkField;
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<BlogPost>>> GetBlogPosts()
        {
            return await _context.BlogPosts.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<BlogPost>> GetBlogPost(int id)
        {
            var blogPost = await _context.BlogPosts.FindAsync(id);

            if (blogPost == null)
            {
                return NotFound();
            }

            return blogPost;
        }

        [HttpPut("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> PutBlogPost(int id, BlogPost blogPost)
        {
            
            var tmpBlogPost = await _context.BlogPosts.FindAsync(id);
            if (tmpBlogPost != null)
            {

                tmpBlogPost.Title = _checkField.CheckModelField(tmpBlogPost.Title, blogPost.Title);
                tmpBlogPost.Category = _checkField.CheckModelField(tmpBlogPost.Category, blogPost.Category);
                tmpBlogPost.Information = _checkField.CheckModelField(tmpBlogPost.Information, blogPost.Information);
                tmpBlogPost.Image = _checkField.CheckModelField(tmpBlogPost.Image, blogPost.Image);
                tmpBlogPost.IsLocked = _checkField.CheckModelField(tmpBlogPost.IsLocked, blogPost.IsLocked);

            }
            else
            {
                return NotFound();
            }


            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BlogPostExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        [HttpPost]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<ActionResult<BlogPost>> PostBlogPost(BlogPost blogPost)
        {
            _context.BlogPosts.Add(blogPost);
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetBlogPost", new { id = blogPost.BlogPostId }, blogPost);
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> DeleteBlogPost(int id)
        {
            var blogPost = await _context.BlogPosts.FindAsync(id);
            if (blogPost == null)
            {
                return NotFound();
            }

            _context.BlogPosts.Remove(blogPost);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BlogPostExists(int id)
        {
            return _context.BlogPosts.Any(e => e.BlogPostId == id);
        }
    }
}
