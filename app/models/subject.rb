class Subject < ActiveHash::Base
  self.data = [
    { id: 0, name: '選択してください' },
    { id: 1, name: '算数' },
    { id: 2, name: '国語' },
    { id: 3, name: '英語' },
    { id: 4, name: '数学' },
    { id: 5, name: '理科' },
    { id: 6, name: '社会' },
    { id: 7, name: '美術' },
    { id: 8, name: '技家' },
    { id: 9, name: '保体' },
    { id: 10, name: '音楽' },
    { id: 11, name: 'その他' }
  ]
end