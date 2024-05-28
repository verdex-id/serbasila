using Godot;
using System;
using MongoDB.Driver;
using MongoDB.Bson;

public partial class db_manager : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Console.WriteLine("Wait...");
		var connectionString = "mongodb+srv://ticsstech:stech12345@cluster0.bpsszd2.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

		var client = new MongoClient(connectionString);
		var collection = client.GetDatabase("serbasila").GetCollection<BsonDocument>("ranks");
		var filter = Builders<BsonDocument>.Filter.Eq("title", "Back to the Future");
		var document = collection.Find(filter).First();
		Console.WriteLine(document);
		Console.WriteLine("Done...");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
