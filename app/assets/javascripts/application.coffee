# = require jquery
# = require jquery_ujs
# = require jquery.turbolinks
# = require bootstrap
# = require nprogress
# = require nprogress-turbolinks
# = require react
# = require radium
# = require react_ujs
# = require turbolinks

@Photos = Radium React.createClass
  render: ->
    {
      div
      input
      span
      a
      p
      canvas
      img
    } = React.DOM
    div 
      style: 
        margin: '-10px'
      @props.photos.map (photo)=>
        a
          key: photo.f_id
          style:
            transition: 'all ease .5s'
            float: 'left'
            height: if photo.f_id == @state.active_f_id then 360 else 90
            width: if photo.f_id == @state.active_f_id then 360 else 90
            overflow: 'hidden'
            backgroundImage: "url(#{if photo.f_id == @state.active_f_id then photo.url else photo.thumbnail})"
            backgroundRepeat: 'no-repeat'
            backgroundPosition: '50% 50%'
          href: photo.link
          onClick: (ev)=>
            ev.preventDefault()
            @setState active_f_id: photo.f_id
      div
        style:
          clear: 'both'
          height: 1
