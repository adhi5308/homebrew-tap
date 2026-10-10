cask "keythock" do
  version "0.1.2"
  sha256 "d3afca9a09d6381efa0b4d61d2ec57f155d5021229aa1e1f9bb4a12c09a170ab"

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
