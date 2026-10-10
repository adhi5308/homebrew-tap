cask "keythock" do
  version "0.1.0"
  sha256 "929fddca3f9a0182146cd0044c5436de9da9bd6c962b903b6411f90432bfd2b3"

  url "https://github.com/adhi5308/KeyThock/releases/download/v#{version}/KeyThock-#{version}.zip"
  name "KeyThock"
  desc "Menu-bar mechanical keyboard sounds for macOS"
  homepage "https://github.com/adhi5308/KeyThock"

  depends_on macos: ">= :ventura"

  app "KeyThock.app"

    # KeyThock listens for keyboard events only after the user grants macOS
  # Accessibility permission. It records and sends no keystroke data.
  postflight do
    quarantine = "/usr/bin/xattr"
    system_command quarantine, args: ["-dr", "com.apple.quarantine", "#{appdir}/KeyThock.app"], sudo: false
  end
end
