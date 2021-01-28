// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import '../css/app.scss';

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import 'phoenix_html';
import '../node_modules/materialize-css/dist/js/materialize';
document.addEventListener('DOMContentLoaded', function () {
	const select = document.querySelectorAll('select');
	const collapsible = document.querySelectorAll('.collapsible');
	const expandable = document.querySelector('.collapsible.expandable');
	const tooltipped = document.querySelectorAll('.tooltipped');

	M.FormSelect.init(select, []);
	M.Collapsible.init(collapsible, []);
	M.Tooltip.init(tooltipped, []);
	M.Collapsible.init(expandable, {
		accordion: false,
	});
});
