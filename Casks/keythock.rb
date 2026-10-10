cask "keythock" do
  version "0.1.3"
  sha256 "725f24f2357320621e221a50e95b0e13eb85872545904f3ad48cb9dc2ca438c3"

  url "https://github.com/adhi5308/KeyThock/releases/download/v#{version}/KeyThock-#{version}.zip"
  name "KeyThock"
  desc "Menu-bar mechanical keyboard sounds for macOS"
  homepage "https://github.com/adhi5308/KeyThock"

  depends_on macos: :ventura

  app "KeyThock.app"

    # KeyThock listens for keyboard events only after the user grants macOS
  # Accessibility permission. It records and sends no keystroke data.
  postflight do
    quarantine = "/usr/bin/xattr"
    system_command quarantine, args: ["-dr", "com.apple.quarantine", "#{appdir}/KeyThock.app"], sudo: false
  end
end
