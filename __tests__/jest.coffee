describe 'compatible middle for jest', ->
  base = a: 88
  target = a: 11, b: 'gaga'

  it """
    use jest plugin to test base = #{JSON.stringify base}, target = #{JSON.stringify target}
  """, ->
    expect(target).toBeCompatible base
    expect(base).not.toBeCompatible target