extends Node

var markets : FirestoreCollection
var products : FirestoreCollection
var prices : FirestoreCollection

func get_collections():
	markets = Firebase.Firestore.collection("markets")
	products = Firebase.Firestore.collection("products")
	prices = Firebase.Firestore.collection("prices")
	
func add_market(market_name:String, latitude:float, longitude:float):
	
	var market_data := {
		"name": market_name,
		"address": { "latitude" : latitude, "longitude" : longitude},
		"createdBy": Firebase.Auth.auth.localid,
		"createdAt": Time.get_unix_time_from_system()
	}

	var document := await markets.add("", market_data)
	return document

func get_markets() -> Array:
	return await Firebase.Firestore.list("markets")
