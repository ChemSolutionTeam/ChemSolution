const colors = require('tailwindcss/colors')
module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
    colors: {
      csblack: '#2F455C',
      csgreen: '#21D0B2',
      cslightgreen: '#34F5C5',
      csblue: '#1DCDFE',
      red: colors.red,
      teal: colors.teal,
      white: colors.white,
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
