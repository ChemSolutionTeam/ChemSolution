const colors = require('tailwindcss/colors')
module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fill: ['hover', 'focus'],
      width: {
        two: '200%',
        half: '50vw',
      },
      scale: {
        200: '2',
        250: '2.5',
      },
      keyframes: {
        wiggle: {
          '0%, 100%': { transform: 'rotate(-3deg)' },
          '50%': { transform: 'rotate(3deg)' },
        },
        bonk: {
          '0%, 100%': { transform: 'none' },
          '50%': { transform: 'scaleY(0.5)' },
        },
      },
      animation: {
        wiggle: 'wiggle 1s ease-in-out infinite',
        bounce: 'bounce 1s ease-in-out infinite',
        bonk: 'bonk 1s ease-in-out infinite',
        'wiggle-fast': 'wiggle 0.25s ease-in-out infinite',
        'spin-fast': 'spin 0.25s linear infinite',
      },
    },
    colors: {
      csblack: '#2F455C',
      csgreen: '#21D0B2',
      cslightgreen: '#34F5C5',
      csblue: '#1DCDFE',
      csbluewhite: '#EAF9FE',
      category1: '#a1c768',
      category2: '#8400ff',
      category3: '#b8741a',
      category4: '#f59a23',
      category5: '#87131e',
      category6: '#cccc00',
      category7: '#cc66b0',
      category8: '#21d0b2',
      category9: '#1dcdfe',
      category10: '#696969',
      requestcancel: '#FFB7B8',
      requestaccept: '#CEFFB7',
      requestwait: '#BFF6FA',

      shopbg: '#b8ffe6',
      shopsale: '#49d40a',
      red: colors.red,
      amber: colors.amber,
      orange: colors.orange,
      pink: colors.pink,
      emerald: colors.emerald,
      yellow: colors.yellow,
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
    scrollbar: ['rounded'],
  },
  plugins: [require('@tailwindcss/forms'), require('tailwind-scrollbar')],
}
