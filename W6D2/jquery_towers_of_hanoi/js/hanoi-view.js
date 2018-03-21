class HanoiView {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupTowers();
    this.render();
  }

  render () {
    $('ul').hover(event => {
      $(event.currentTarget).addClass("hovered");
    }, event => {
      $(event.currentTarget).removeClass("hovered");
    });

  }

  clickTower() {

  }



  setupTowers() {
    this.el.append("<ul></ul>");

    for (let i = 1; i <= 3; i++) {
      const story = $('<li></li>');

      story.data("length", i);
      story.addClass(`length-${i}`)
      $("ul").append(story);
    }
    this.el.append("<ul></ul>");
    this.el.append("<ul></ul>");
  }
}

module.exports = HanoiView;
