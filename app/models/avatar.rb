class Avatar < ActiveHash::Base
  self.data = [
    { id: 1, name: '---', icon: ''},
    { id: 2, name: '勇者', icon: 'ch_yusha.png'},
    { id: 3, name: '戦士', icon: 'ch_senshi.png'},
    { id: 4, name: '魔法使い', icon: 'ch_mahou.png'},
    { id: 5, name: '僧侶', icon: 'ch_souryo.png'},
    { id: 6, name: '村人', icon: 'ch_murabito.png'}
  ]

  include ActiveHash::Associations
  has_many :users

end