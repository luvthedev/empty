module.exports = function (eleventyConfig) {
  // Pass through static assets to the build directory
  eleventyConfig.addPassthroughCopy("src/assets");

  return {
    dir: {
      input: "src",
      output: "build",
      includes: "_includes",
      layouts: "layouts",
      data: "_data",
    },
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk",
  };
};
