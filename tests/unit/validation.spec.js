import validation from '../../src/services/validation'

describe('Validation tests', () => {
  test('PassRepeat tests', () => {
    expect(validation.passRepeat('12345', '123')).toBe(false)
    expect(validation.passRepeat('lower', 'lower')).toBe(true)
    expect(validation.passRepeat('Upper', 'Upper')).toBe(true)
    expect(validation.passRepeat('lower', 'Upper')).toBe(false)
    expect(validation.passRepeat('', '')).toBe(false)
    expect(validation.passRepeat('', undefined)).toBe(false)
    expect(validation.passRepeat(undefined, undefined)).toBe(false)
  })
  test('Pass tests', () => {
    //edge
    expect(validation.pass('')).toBe(false)
    expect(validation.pass(undefined)).toBe(false)

    expect(validation.pass('1234')).toBe(false)
    expect(validation.pass('123456789')).toBe(false)
    expect(validation.pass('123456789A')).toBe(false)
    expect(validation.pass('123456789Aa')).toBe(false)
    expect(validation.pass('123456789Aa!')).toBe(true)
    expect(validation.pass('Q#51P_XrF~5')).toBe(true)
    expect(validation.pass('*p42nj{+Xb;')).toBe(true)
  })
  test('Age tests', () => {
    //edge
    expect(validation.age('')).toBe(false)
    expect(validation.age(undefined)).toBe(false)

    expect(validation.age()).toBe(false)
    expect(validation.age()).toBe(false)
    expect(validation.age()).toBe(false)
  })
})
