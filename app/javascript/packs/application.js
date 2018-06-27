import "bootstrap";
import "plugins/flatpickr";

import { entireVideoFile } from "components/video";
import { scrollLastMessageIntoView } from "components/scroll";
import { keepCount } from "components/keep_count";
import { toggleSearch } from "components/toggle";


const userEdit = document.getElementById("user-edit-page");
const chatList = document.getElementById("chatlist-page");
const searchFormId = document.getElementById("search-bar");
const videoId = document.getElementById("video-start-here-dash");

if (userEdit) {
  keepCount();
}

if (chatList) {
  scrollLastMessageIntoView();
}

if (searchFormId) {
  toggleSearch();
}

if (videoId) {
  entireVideoFile();
}























// Piotr, please refacter


