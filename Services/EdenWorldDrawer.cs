using System.Drawing;
using System.Reflection;

namespace EdenWorldTools.Services {
    public class EdenWorldDrawer {

        public Models.EdenWorld? World { get; set; }
        public int BlocksInWorld { get; private set; } = 0;
        public Bitmap? Canvas { get; private set; }

        public void CreateBitmap() {

            bool isBlockPainted = false;
            Canvas = new Bitmap(World.Area.Width * 16, World.Area.Height * 16);


            foreach (int address in World.Chunks.Keys) {
                int baseX = (World.Chunks[address].X - World.Area.X) * 16, baseY = (World.Chunks[address].Y - World.Area.Y) * 16;
                for (int x = 0; x < 16; x++) {
                    for (int y = 0; y < 16; y++, isBlockPainted = false) {
                        for (int baseHeight = 3; baseHeight >= 0; baseHeight--) {
                            for (int z = 15; z >= 0; z--) {
                                if (World.WorldData[address + baseHeight * 8192 + x * 256 + y * 16 + z] != 0) //Block
                                {
                                    BlocksInWorld++;
                                    if (World.WorldData[address + baseHeight * 8192 + x * 256 + y * 16 + z + 4096] != 0 && isBlockPainted == false) //Color
                                    {
                                        int pen = World.WorldData[address + baseHeight * 8192 + x * 256 + y * 16 + z + 4096] - 1;
                                        Canvas.SetPixel(baseX + x, baseY + y, MapColors.Painted[pen]);
                                        isBlockPainted = true;
                                    } else if (isBlockPainted == false) {
                                        int pen = World.WorldData[address + baseHeight * 8192 + x * 256 + y * 16 + z] - 1;
                                        Canvas.SetPixel(baseX + x, baseY + y, MapColors.Unpainted[pen]);
                                        isBlockPainted = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Canvas.RotateFlip(RotateFlipType.Rotate180FlipNone);

        }


    }
}
