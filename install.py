#!/usr/bin/env python3
from pathlib import Path
import sys


def main():
    this_dir = Path(__file__).resolve().parent
    home_dir = Path.home()

    files = [".zshrc", ".zshenv", ".zlogin", ".zprofile"]
    for name in files:
        target = this_dir / name  # シンボリック先（元ファイル）
        link = home_dir / name  # ホームに作るリンクパス

        print(f"ln -s {target} {link}")

        # 既にシンボリックリンクがある場合、スキップ
        if link.is_symlink():
            try:
                resolved = link.resolve()
            except Exception:
                resolved = None
            if resolved == target.resolve():
                print(f"  already exists and correct: {link} -> {resolved}")
            else:
                print(
                    f"  skip: existing symlink {link} points to {resolved}, not {target}",
                    file=sys.stderr,
                )
            continue

        # 既に通常ファイル/ディレクトリが存在する場合は上書きせずにスキップ
        if link.exists():
            print(
                f"  skip: file already exists at {link} (not a symlink)",
                file=sys.stderr,
            )
            continue

        # シンボリック作成
        try:
            link.symlink_to(target)
            print(f"  created: {link} -> {target}")
        except PermissionError as e:
            print(f"  error: permission denied creating symlink: {e}", file=sys.stderr)
        except OSError as e:
            print(f"  error creating symlink: {e}", file=sys.stderr)


if __name__ == "__main__":
    main()
