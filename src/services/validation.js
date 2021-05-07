export default {
  age(birthDate) {
    let userYear = parseInt(birthDate.toString().split('-')[0])
    let currentYear = new Date().getFullYear()
    return userYear < currentYear - 120 || userYear > currentYear - 3
  },
  pass(pass) {
    return !pass.match(
      new RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{8,})')
    )
  },
  passRepeat(pass, passRepeat) {
    return pass != passRepeat
  },
}
