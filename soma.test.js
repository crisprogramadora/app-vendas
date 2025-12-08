const soma = require('./soma');

test('soma dois números positivos', () => {
    expect(soma(2, 3)).toBe(5);
})
