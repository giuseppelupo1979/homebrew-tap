class Aggiornamenti < Formula
  desc "Local web page that finds outdated Mac apps and updates them silently"
  homepage "https://github.com/giuseppelupo1979/aggiornamenti-mac"
  url "https://github.com/giuseppelupo1979/aggiornamenti-mac/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "2327a8a0c08694e1ca58e37c85c1a6260de7edfe881b6b56bd5bc4251f96cddd"
  license "MIT"

  depends_on :macos
  depends_on "mas"
  depends_on "terminal-notifier"

  def install
    libexec.install Dir["*"] - ["docs"]
    (bin/"aggiornamenti").write_env_script libexec/"aggiornamenti",
      AGGIORNAMENTI_HOME: opt_libexec,
      AGGIORNAMENTI_BIN:  opt_bin/"aggiornamenti"
  end

  def caveats
    <<~EOS
      Open the page (http://127.0.0.1:8765):
        aggiornamenti
      Add an app to the Desktop:
        aggiornamenti app
      Try it without changing anything:
        aggiornamenti demo
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aggiornamenti version").strip
  end
end
