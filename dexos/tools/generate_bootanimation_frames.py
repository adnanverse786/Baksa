#!/usr/bin/env python3
"""Generate minimal DexOS boot animation frames (PNG) for part0/part1."""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1] / "bootanimation"


def make_frame(path: Path, text: str, color: tuple[int, int, int]):
    img = Image.new("RGB", (1080, 2340), (0, 0, 0))
    d = ImageDraw.Draw(img)
    d.ellipse((390, 1020, 690, 1320), fill=color)
    d.text((430, 1370), text, fill=(255, 255, 255))
    img.save(path)


def main():
    (ROOT / "part0").mkdir(parents=True, exist_ok=True)
    (ROOT / "part1").mkdir(parents=True, exist_ok=True)
    for i, c in enumerate([(80, 180, 255), (60, 140, 220), (35, 100, 190), (20, 70, 160)]):
        make_frame(ROOT / "part0" / f"{i:05d}.png", "DEXOS", c)
    make_frame(ROOT / "part1" / "00000.png", "READY", (15, 180, 90))


if __name__ == "__main__":
    main()
