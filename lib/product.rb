module Product
  PRODUCT = {
    :name => 'A T&C Document',
    :desc => 'This document is made of plaintext.',
    :uniform_word => 'Is made of',
    :clauses => [
      { 'id': 1, 'text': 'The quick brown fox' },
      { 'id': 2, 'text': 'jumps over the lazy dog.' },
      { 'id': 3, 'text': 'And dies.' },
      { 'id': 4, 'text': 'The white horse is white.' }
    ],
    :sections => [
      { 'id': 1, 'clauses_ids': [1, 2] }
    ],
    :footer => 'Your legals.'
  }
end
