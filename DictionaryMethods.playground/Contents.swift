let toyStoryFilms = [
    "Toy Story",
    "Toy Story 2",
    "Buzz Lightyear of Star Command: The Adventure Begins",
    "Toy Story 3",
    "Toy Story 4"
]

let starWarsFilms = [
    "Star Wars",
    "The Empire Strikes Back",
    "Star Wars: Episode VI",
    "Star Wars: Episode I",
    "Star Wars: Episode II",
    "Star Wars: Episode III",
    "Star Wars: The Clone Wars",
    "Star Wars: The Force Awakens",
    "Star Wars: Episode VIII",
    "Star Wars: Episode IX"
]

let fastAndFuriousFilms = [
    "The Fast and the Furious",
    "2 Fast 2 Furious",
    "Turbo-Charged Prelud",
    "Tokyo Drift",
    "Fast & Furious",
    "Los Bandoleros",
    "Fast Five",
    "Fast & Furious 6",
    "Furious 7",
    "Fast 8"
]

var movies = [
    "Toy Story": toyStoryFilms,
    "Star Wars": starWarsFilms,
    "The Fast and the Furious": fastAndFuriousFilms
]
movies.updateValue(fastAndFuriousFilms, forKey: "The Fast and the Furious") // updates value

let godfatherFilms = [
    "The Godfather",
    "The Godfather Part II",
    "The Godfather Part III"
]
//movies["The Godfather"] = godfatherFilms // update value [for key]
//
//
//movies.updateValue(godfatherFilms, forKey: "The Godfather") //returns nil, The main difference is (with line 40) that updateValue(_:forKey:) has a return value that tells you whether a key was added or updated. The return type is an optional, so it can be nil....If a new key/value pair was added, the return value is nil. If an existing key/value pair was updated, the return value of updateValue(_:forKey:) is the key's new value, wrapped in an Optional. Either way they need to be unwrapped.
//
//
//print(godfatherFilms) //prints







// UPDATING KEYS

let result1 = movies.updateValue(godfatherFilms, forKey: "The Godfather")
let result2 = movies.updateValue(fastAndFuriousFilms, forKey: "The Fast and the Furious")

print(result1)  // nil
print(result2)  // optional

//Now that you've added "The Godfather" key, you should be able to retrieve the value. What gets printed to the console when you run this code?

let films = movies["The Godfather"]
print(films)

if let godfatherMovies = movies["The Godfather"] {   //unwrapping - because accessing a key always returns an Optional,
    print(godfatherMovies)
}



// MODIFYING VALUES



//movies["The Fast and the Furious"].append("Faster! 9") these are optionals so we must unwrap them before we can simply append them.
//movies["The Fast and the Furious"].append("THE FASTEST 10")oes not return an array (a [String]). It returns an optional array (a [String]?). Optional types do not have an append() method.
//
//
// The dictionary hasn't been updated to include these two hot new titles. Why not? When you unwrap an optional, you get a copy of the array back. When you call append() on this copy, it doesn't affect the original array stored in the dictionary. In order to update that array, you're going to have to get a bit more clever.
//
//if var films = movies["The Fast and the Furious"] {
//    films.append("Faster! 9")
//    films.append("THE FASTEST 10")
//}
//

/////What's happening here? Like before, you unwrapped the optional value of movies["The Fast and the Furious"] into the films variable. Then you added "Faster! 9" and "THE FASTEST 10" to the films variable. Finally, you assigned films to the key "The Fast and the Furious" in the movies dictionary. That's the crucial step in updating the value of "The Fast and the Furious" in the dictionary:


if var films = movies["The Fast and the Furious"] {
    films.append("Faster! 9")
    films.append("THE FASTEST 10")
    
    movies["The Fast and the Furious"] = films
}
// prints:
// 1. The Fast and the Furious
// 2. 2 Fast 2 Furious
// 3. Turbo-Charged Prelud
// 4. Tokyo Drift
// 5. Fast & Furious
// 6. Los Bandoleros
// 7. Fast Five
// 8. Fast & Furious 6
// 9. Furious 7
// 10. Fast 8
// 11. Faster! 9
// 12. THE FASTEST 10

if let fastMovies = movies["The Fast and the Furious"] {
    for (index, film) in fastMovies.enumerate() {
        print("\(index + 1). \(film)")
    }
}



// DELETING KEY/VALUE PAIRS

movies["The Fast and the Furious"] = nil  //just use nil to delete a pair

if let fast3rFilms = movies["The Fast and the Furious"] {  // this is how you confirm that it's deleted.
    print("\(fast3rFilms)")
} else {
    print("YAY! no more Fast & Furious movies!")
}

movies.removeValueForKey("The Fast and the Furious") //REMEMBER the updateValue(_:forKey:) METHOD, though? There is a corresponding Dictionary method called removeValueForKey(). You can also remove a key using that method:



// COUNTING ITEMS

let planetsAndTheirMoons = [
    "Mercury": 0,
    "Venus": 0,
    "Earth": 1,
    "Mars": 2,
    "Jupiter": 50,
    "Saturn": 53,
    "Uranus": 27,
    "Neptune": 13
]

var planetCount = 0
for (planet, numberOfMoons) in planetsAndTheirMoons {
    planetCount += 1
}
print(planetCount)
//prints 8


let planetCount2 = planetsAndTheirMoons.count
print(planetCount2) //// prints 8 in an easier way because of the COUNT PROPERTY ***


if planetsAndTheirMoons.isEmpty {
    print("planetsAndTheirMoons is empty")
} else {
    print("planetsAndTheirMoons has \(planetsAndTheirMoons.count) items")
}


var emptyDictionary = [String: String]()
if emptyDictionary.isEmpty {
    print("Ah hah! It's empty.")
} else {
    print("There's something here...")
}




// RETRIEVING KEYS

let planetNames = Array(planetsAndTheirMoons.keys)

for planet in planetsAndTheirMoons.keys {
    print(planet)
}



// RETRIEVING VALUES

let allTheMoons = Array(planetsAndTheirMoons.values)

for numberOfMoons in planetsAndTheirMoons.values {
    print(numberOfMoons)
}
