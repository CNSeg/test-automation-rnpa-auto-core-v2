const params = () => ({
  page(page) {
    return `?query=_page:${page}`;
  },
  pageSize(pageSize) {
    return `?query=_page_size:${pageSize}`;
  }
});

module.exports = params;