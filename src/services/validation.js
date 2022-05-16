export default {
  age(birthDate) {
    if (birthDate === undefined || birthDate.length === 0) {
      return false
    } else {
      let userYear = parseInt(birthDate.toString().split('-')[0])
      let currentYear = new Date().getFullYear()
      return !(userYear < currentYear - 120 || userYear > currentYear - 3)
    }
  },

  pass(pass) {
    if (pass.length === 0 || pass === undefined) {
      return false
    }
    return !!pass.match(
      new RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{8,})')
    )
  },

  passRepeat(pass, passRepeat) {
    return (
      pass === passRepeat &&
      pass !== '' &&
      passRepeat !== '' &&
      pass !== undefined &&
      passRepeat !== undefined
    )
  },
}
