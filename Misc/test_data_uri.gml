// init
trace("hi!");
frame = 0;
//s = sprite_add("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==",
//1, false, false, 0, 0);
s = sprite_add("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAAAgCAYAAADtwH1UAAACN0lEQVRo3u1aMW+CQBj9rmHzT/gDKKVpujE5dTXdjaMJI6sjq0MHEkc03bt2YiKdbERkNv4ImenQHMUrRQ++49DemwhceMd7777LdwqgoKCgoPBfQXgGm7qRnTs2SmKi5D0NjUf86aB39otdMDJsE2QHQAQ/ESF+bkKQognBHQBEbpH8RJT4mELIDoBIfiJSfAwhZAdANP9NlzcojABMBz2u2t02P7cBT6NJ7XsKF7YCuhgAbH7hBrhBqmKO0QcU8fzyAfe3dwAAEPpO7rg1ngEAwHq7gfRz2YmmTHYATvFrl5ga2QHA5K9dgtbbDdd9BcQVQN2l7lOEvnPkvEist5s8hTICgMXfqATRJVdmhkjIDgAmP8oeUCb++3IuXAhZAcDk17CFb0v8LgQAg5/LADdIwQ3KXS+mgbbgMj68TfEx+DUe8fu2d3Sv92AVNp8RDOfhz3jPzk0wdZzfBtgAsBseuymK5scIYKMSNJyH8Dax8usi+rYHrmfnk7TGs0YilAWA5Wefi+bHCGBlHxAlMWE7ub1n/xKBFZ+OYSeMAdn8LHfZdR7AIIXQdyD0nT9PRE+ugCiJiQtGxvsxVASrQTdKueuIiclfLCd7zz6aCyt8ccz3uJ2cowis9j9KYlLnPB+TX2QAzzbg9XGXv5AtA21ANn9VGWwSgIs8jJOBYgBaPwuKkphY41km6+Nl83cGpm5kh9UiO6wWGVuXq55dA7+pG5kI/tr/jGNrXNUzTBGujf8GFKTiCyaM9JHdvKC7AAAAAElFTkSuQmCC",
1, false, false, 0, 0);

#define step
// step event code
frame += delta_time/1000000;

#define draw
// draw event code
scr_show("hi!");
draw_sprite(s, 0, 100, 100);

#define scr_show
// define scripts like this
draw_text(10, 10 + sin(frame / 0.7) * 3, argument0);
