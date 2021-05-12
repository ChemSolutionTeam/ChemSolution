const colors = require('tailwindcss/colors')
module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      width: {
        two: '200%',
      },
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
      amber: colors.amber,
      orange: colors.orange,
      pink: colors.pink,
      teal: colors.teal,
      white: colors.white,
      green: colors.green,
      blue: colors.blue,
      indigo: colors.indigo,
      grey: colors.gray,
      gray: colors.gray,
      transparent: colors.transparent,
      purple: colors.purple,

      tAlkalineEarthMetal: {
        light: '#f59a23',
        dark: '#ab6b18',
      },
      tAlkaliMetal: {
        light: '#b8741a',
        dark: '#805112',
      },
      tTransitionMetal: {
        light: '#87131e',
        dark: '#5e0d15',
      },
      tLanthanoid: {
        light: '#cccc00',
        dark: '#888800',
      },
      tActinoid: {
        light: '#cc66b0',
        dark: '#8e477b',
      },
      tMetalloid: {
        light: '#21d0b2',
        dark: '#17917c',
      },
      tPostTransitionMetal: {
        light: '#1dcdfe',
        dark: '#148fb1',
      },
      tNobleGas: {
        light: '#8400ff',
        dark: '#5c00b2',
      },
      tReactiveNonMetal: {
        light: '#a1c768',
        dark: '#657c41',
      },
      tUnknown: '#696969',
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
