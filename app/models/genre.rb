class Genre < ActiveHash::Base

  self.data = [
    { id: 0, name: '選択してください' },
    { id: 1, name: '質問' },
    { id: 2, name: '勉強法' },
    { id: 3, name: 'アウトプット' },
    { id: 4, name: 'その他' }
  ]
end