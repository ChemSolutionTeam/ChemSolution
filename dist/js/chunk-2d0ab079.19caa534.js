(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d0ab079"],{1411:function(e,t,r){"use strict";r.r(t);var o=r("7a23"),c=Object(o["i"])("h1",{class:"text-5xl"},"BlogPosts Inspect page",-1),s={class:"flex flex-wrap mx-3 my-5"},n={class:"border-2 overflow-x-auto border-csgreen rounded-xl rounded-b-none bg-cslightgreen bg-opacity-25 shadow-lg"},b={class:"w-11/12 py-2 px-5 divide-y divide-gray-200 table-auto"},i=Object(o["i"])("thead",{class:""},[Object(o["i"])("tr",{class:"text-csblack uppercase"},[Object(o["i"])("th",{class:"py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"}," Id "),Object(o["i"])("th",{class:"py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"}," Title "),Object(o["i"])("th",{class:"py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"}," Category "),Object(o["i"])("th",{class:"py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"}," Information "),Object(o["i"])("th",{class:"py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"}," Image "),Object(o["i"])("th",{class:"py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"}," IsLocked ")])],-1),d={class:"text-csblack"},a={class:"border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"},l={class:"border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"},p={class:"border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"},u={class:"border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"},g={class:"border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"},j={class:"border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"},x={class:"border border-t-0 px-5 border-csgreen whitespace-nowrap"},O={class:"flex justify-end"};function f(e,t,r,f,h,w){var y=Object(o["y"])("Button");return Object(o["s"])(),Object(o["e"])("div",null,[c,Object(o["i"])(y,{label:"Додати пост",class:"w-3/12",onClick:t[1]||(t[1]=function(e){return w.create()})}),Object(o["i"])(y,{label:"Повернутися",class:"w-3/12",onClick:t[2]||(t[2]=function(e){return w.goBack()}),white:"true"}),Object(o["i"])("div",s,[Object(o["i"])("div",n,[Object(o["i"])("table",b,[i,Object(o["i"])("tbody",d,[(Object(o["s"])(!0),Object(o["e"])(o["a"],null,Object(o["w"])(h.blogposts,(function(e,t){return Object(o["s"])(),Object(o["e"])("tr",{class:"hover:bg-gray-100",key:t},[Object(o["i"])("td",a,Object(o["A"])(e.blogPostId),1),Object(o["i"])("td",l,Object(o["A"])(e.title),1),Object(o["i"])("td",p,Object(o["A"])(e.сategory),1),Object(o["i"])("td",u,Object(o["A"])(e.information),1),Object(o["i"])("td",g,Object(o["A"])(e.image),1),Object(o["i"])("td",j,Object(o["A"])(e.isLocked),1),Object(o["i"])("td",x,[Object(o["i"])("div",O,[Object(o["i"])("button",{class:"px-4 focus:outline-none focus:ring focus:ring-offset-2 focus:ring-csgreen shadow-md bg-gradient-to-tr from-csgreen to-cslightgreen w-full p-1 m-1 border rounded-xl",onClick:function(t){return w.edit(e)}}," Edit ",8,["onClick"]),Object(o["i"])("button",{onClick:function(t){return w.remove(e)},class:"focus:outline-none focus:ring focus:ring-offset-2 focus:ring-red-300 shadow-md bg-gradient-to-tr from-red-400 to-red-500 text-white w-full p-1 m-1 border rounded-xl"}," Remove ",8,["onClick"])])])])})),128))])])])])])}var h=r("6340"),w=r("a18c"),y=r("dde5"),m={name:"Inspect",components:{Button:h["a"]},methods:{goBack:function(){w["a"].push("/admin")},edit:function(e){w["a"].push("/admin/blogposts/edit/"+e.blogPostId)},remove:function(e){w["a"].push("/admin/blogposts/delete/"+e.blogPostId)},create:function(){w["a"].push("/admin/blogposts/create/")}},mounted:function(){var e=y["a"].getBlogPosts();null!=e&&void 0!=e&&(this.blogposts=e)},data:function(){return{blogposts:[{blogPostsId:1}]}}};m.render=f;t["default"]=m}}]);
//# sourceMappingURL=chunk-2d0ab079.19caa534.js.map