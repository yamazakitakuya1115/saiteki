class Grade < ActiveHash::Base
  self.data = [
    { id: 0, name: '選択してください' },
    { id: 1, name: '小学生' },
    { id: 2, name: '中1' },
    { id: 3, name: '中2' },
    { id: 4, name: '中3' },
    { id: 5, name: '高校生' },
    { id: 6, name: 'その他' }
  ]
end