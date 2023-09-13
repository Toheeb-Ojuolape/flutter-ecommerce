String shortenTitle(String title) {
  if (title.length > 25) {
    return '${title.substring(0, 25)}...';
  } else {
    return title;
  }
}
