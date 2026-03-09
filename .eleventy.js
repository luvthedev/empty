module.exports = function (eleventyConfig) {
  // Pass through static assets
  eleventyConfig.addPassthroughCopy("src/assets");

  return {
    dir: {
      input: "src",
      output: "build",
      includes: "layouts",
    },
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk",
  };
};
