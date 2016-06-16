define (require, exports, module) ->
  _ = require 'underscore'
  stub = {}
  stub.news = [
    {
      pager: {
        page: 0
        total_pages: 2
      }
      news: [
        {
          id: 1
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news1'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 2
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news2'
          # image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
          image: ''
        }
        {
          id: 3
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news3'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 4
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news4'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 5
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news5'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
      ]
    }
    {
      pager: {
        page: 1
        total_pages: 2
      }
      news: [
        {
          id: 6
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news1'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 7
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news2'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
          # image: ''
        }
        {
          id: 8
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news3'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 9
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news4'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 10
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news5'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
      ]
    }
    {
      pager: {
        page: 2
        total_pages: 2
      }
      news: [
        {
          id: 11
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news1'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 12
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news2'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
          # image: ''
        }
        {
          id: 13
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news3'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 14
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news4'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
        {
          id: 15
          date: '06.01.2016'
          title: 'News title'
          preview: 'Preview news text. Preview news text. Preview news text. Preview news text. Preview news text'
          url: '/news5'
          image: 'http://missmanga.loreal-paris.ru/system/uploads/photo/image/000/000/503/thumb_image.jpg'
        }
      ]
    }
  ]

  stub.feedback_success = {
    success: true
    msg: 'Сообщение отправлено, в ближайшее время наш менеджер свяжется с Вами.'
  }

  stub.feedback_fail = {
    success: false
    field: {
      name: 'email'
      error: 'Введенный Вами e-mail не найден.'
    }
  }

  stub
