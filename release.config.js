module.exports = {
  branches: ["main"],
  repositoryUrl: "https://github.com/kayla1000/s3-module-ticket.git",
  plugins: [
    '@semantic-release/commit-analyzer',
    '@semantic-release/release-notes-generator',
    '@semantic-release/git',
    '@semantic-release/github'
  ]
};
