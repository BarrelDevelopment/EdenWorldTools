using EdenWorldTools.Models;
using System.Drawing;
using System.Text;

namespace EdenWorldTools.Services {
    public class EdenWorldLoader {

        public EdenWorld Load(byte[] fileData) {
            EdenWorld world = new EdenWorld();
            List<int> skyColor = new List<int>();

            world.WorldData = fileData;

            //Get Sky Color
            for (int i = 132; i <= 148; i++) {
                if (world.WorldData[i] != 14) skyColor.Add(world.WorldData[i]);
                System.Console.WriteLine($"Sky Color: {world.WorldData[i]}");
            }
            if (skyColor.Count == 0) world.SkyColor = 14;
            world.SkyColor = skyColor.GroupBy(v => v).OrderByDescending(g => g.Count()).First().Key;

            Console.WriteLine($"Sky Color: {world.SkyColor}");

            int chunkPointerStartIndex = world.WorldData[35] * 256 * 256 * 256 + world.WorldData[34] * 256 * 256 + world.WorldData[33] * 256 + world.WorldData[32];
            Console.WriteLine("Chunk Pointer Start Index: " + chunkPointerStartIndex);

            byte[] nameArray = world.WorldData.TakeWhile((b, i) => ((i < 40 || b != 0) && i <= 75)).ToArray();
            world.WorldName = Encoding.ASCII.GetString(nameArray, 40, nameArray.Length - 40);
            
            world.Chunks = new Dictionary<int, Point>();

            //Create array of chunk points and addresses
            int currentChunkPointerIndex = chunkPointerStartIndex;
            do {
                world.Chunks.Add(
                    world.WorldData[currentChunkPointerIndex + 11] * 256 * 256 * 256 + world.WorldData[currentChunkPointerIndex + 10] * 256 * 256 + world.WorldData[currentChunkPointerIndex + 9] * 256 + world.WorldData[currentChunkPointerIndex + 8],//address
                    new Point(world.WorldData[currentChunkPointerIndex + 1] * 256 + world.WorldData[currentChunkPointerIndex], world.WorldData[currentChunkPointerIndex + 5] * 256 + world.WorldData[currentChunkPointerIndex + 4])); //Position
            } while ((currentChunkPointerIndex += 16) < world.WorldData.Length);

            //Get max dimensions of world
            // To avoid getting error CS1612 we store world area data in a local variable
            // and set word attribute later on
            Rectangle worldArea = Rectangle.Empty;     
            worldArea.X = world.Chunks.Values.Min(p => p.X);
            worldArea.Y = world.Chunks.Values.Min(p => p.Y);
            worldArea.Width = world.Chunks.Values.Max(p => p.X) - worldArea.X + 1;
            worldArea.Height = world.Chunks.Values.Max(p => p.Y) - worldArea.Y + 1;
            world.Area = worldArea;
            return world;
        }

    }
}
