# Rails Frame

레일즈 개발에서 새로운 프로젝트를 생성하면 깔아야하는 젬도 많고, 반복해야하는 작업도 많은데 이를 모두 셋팅해놓은 플젝입니다.
이 플젝을 클론뜨고 이름바꿔서 내부 요소만 바꿔서 쓰시면 됩니다.

Rails Frame 사용법:

bundle
bundle exec figaro install
(이후 application.yml 에 데이터 베이스 키 입력)
rails g active_admin:install
(이후 User 모델에 컬럼 추가)
rake db:craete db:migrate db:seed

