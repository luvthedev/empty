module.exports = function (eleventyConfig) {
  // Pass through static assets
  eleventyConfig.addPassthroughCopy("src/assets");

  // Pass through .htaccess for HTTP Basic Auth on staging
  eleventyConfig.addPassthroughCopy("src/.htaccess");

  return {
    dir: {
      input: "src",
      output: "build",
      includes: "layouts",
      data: "data",
    },
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk",
  };
};
