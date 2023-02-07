class Avatar < ActiveHash::Base
  self.data = [
    { id: 1, name: '---', icon: ''},
    { id: 2, name: '勇者', icon: 'ch_yusha.png'},
    { id: 3, name: '戦士', icon: ''},
    { id: 4, name: '魔法使い', icon: ''},
    { id: 5, name: '僧侶', icon: ''},
    { id: 6, name: '村人', icon: ''}
  ]

  include ActiveHash::Associations
  has_many :users

end