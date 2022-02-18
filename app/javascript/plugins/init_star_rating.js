import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)
import "jquery-bar-rating/dist/themes/css-stars";

const initStarRating = () => {
  $('#review_stars').barrating({
    initialRating: 1,
    theme: 'css-stars'
  });
};

export { initStarRating };
