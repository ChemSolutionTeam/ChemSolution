const colors = require('tailwindcss/colors')
module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      keyframes: {
        wiggle: {
          '0%, 100%': { transform: 'rotate(-3deg)' },
          '50%': { transform: 'rotate(3deg)' },
        },
      },
      animation: {
        wiggle: 'wiggle 1s ease-in-out infinite',
        'spin-fast': 'spin 0.25s linear infinite',
      },
    },
    colors: {
      csblack: '#2F455C',
      csgreen: '#21D0B2',
      cslightgreen: '#34F5C5',
      csblue: '#1DCDFE',
      csbluewhite: '#EAF9FE',
      red: colors.red,
      teal: colors.teal,
      white: colors.white,
      green: colors.green,
      blue: colors.blue,
      indigo: colors.indigo,
      grey: colors.gray,
      gray: colors.gray,
    },
  },
  variants: {
    extend: {
      animation: ['hover', 'focus'],
      opacity: ['disabled'],
    },
  },
  plugins: [require('@tailwindcss/forms')],
}
