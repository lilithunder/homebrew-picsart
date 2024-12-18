
require "language/node"

class CliPicsart < Formula
  desc "CLI tool for interacting with the Picsart API"
  homepage "https://github.com/PicsA/picsart-creative-apis-cli"
  url "https://github.com/PicsArt/picsart-creative-apis-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8c7d9d7bf74a9505b7044dcad09181a13bf0d6c23267bb2e4ef1097d0821a18f"
  license "MIT"
  # Specify the dependency on Node.js
  depends_on "node"

  def install
    # Install the npm packages into libexec
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    # Create symlinks in the bin directory
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Test the installed CLI tool
    system "#{bin}/cli-picsart", "--version"
  end
end
