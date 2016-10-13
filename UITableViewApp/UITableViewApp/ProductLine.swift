//
//  ProductLine.swift
//  UITableViewApp
//
//  Created by GEORGE QUENTIN on 12/10/2016.
//  Copyright © 2016 GEORGE QUENTIN. All rights reserved.
//

import Foundation


class ProductLine {
    
    
    var productType : String
    var products : [Product]
    
    init(productType: String, includedProducts: [Product]){
        
        self.productType = productType
        self.products = includedProducts
    }
    
    class func productLines() -> [ProductLine]
    {
    
        return [self.films(), self.videoGames(), self.tvSeries(), self.music (), self.books()]
    }
    
    private class func films () -> ProductLine
    {
        var products = [Product]()
        
        products.append(Product(title: "A Most Violent Year", 
            description: "In 1981 New York, a fuel supplier (Oscar Isaac) tries to adhere to his own moral compass amid the rampant violence, corruption and decay that threaten his family and his business.",  imageName: "AMostViolentYear.jpg", year: 2015, rating: ProductRating.Brilliant, genres: [Genres.Thriller]))
        
        products.append(Product(title: "The Words", description: "When shallow wannabe-writer Rory (Bradley Cooper) finds an old manuscript tucked away in a bag, he decides to pass the work off as his own. The book, called \"The Window Tears,\" brings Rory great acclaim, until the real author (Jeremy Irons) shows up and threatens to destroy Rory's reputation. Cut to Clayton Hammond (Dennis Quaid), a writer whose popular novel \"The Words\" seems to mirror Rory's story, leading to speculation that the tome is Hammond's thinly veiled autobiography.",imageName: "TheWords.jpg", year: 2012, rating: ProductRating.Brilliant, genres: [Genres.Drama]))
        
         products.append(Product(title: "Boy Hood", description: "The joys and pitfalls of growing up are seen through the eyes of a child named Mason (Ellar Coltrane), his parents (Patricia Arquette, Ethan Hawke) and his sister (Lorelei Linklater). Vignettes, filmed with the same cast over the course of 12 years, capture family meals, road trips, birthday parties, graduations and other important milestones. Songs from Coldplay, Arcade Fire and other artists capture the time period. Directed by Richard Linklater.",imageName: "BoyHood.jpg", year: 2014, rating: ProductRating.Outstanding, genres: [Genres.Family]))
        
        products.append(Product(title: "Coach Carter", description: "In 1999, Ken Carter (Samuel L. Jackson) returns to his old high school in Richmond, California, to get the basketball team into shape. With tough rules and academic discipline, he succeeds in setting the players on a winning streak. But when their grades start to suffer, Carter locks them out of the gym and shuts down their championship season. When he is criticized by the players and their parents, he sticks to his guns, determined that they excel in class as well as on the court.",imageName: "CoachCarter.jpg", year: 2005, rating: ProductRating.Excellent, genres: [Genres.Sport]))
        
        products.append(Product(title: "Woman In Gold", description: "Sixty years after fleeing Vienna, Maria Altmann (Helen Mirren), an elderly Jewish woman, attempts to reclaim family possessions that were seized by the Nazis. Among them is a famous portrait of Maria's beloved Aunt Adele: Gustave Klimt's \"Portrait of Adele Bloch-Bauer I.\" With the help of young lawyer Randy Schoeberg (Ryan Reynolds), Maria embarks upon a lengthy legal battle to recover this painting and several others, but it will not be easy, for Austria considers them national treasures.",imageName: "WomanInGold.jpg", year: 2015, rating: ProductRating.Outstanding, genres: [Genres.Biography]))
        
        return ProductLine(productType: "Movies", includedProducts: products)
        
    }
    
    
    private class func videoGames () -> ProductLine
    {
        var products = [Product]()
        products.append(Product(title: "Doom", description: "Doom is played entirely from a first-person perspective, with players taking the role of an unnamed marine, as he battles demonic forces from Hell that have been unleashed by the Union Aerospace Corporation on a future-set colonized planet Mars.",imageName: "Doom.jpg", year: 2016, rating: ProductRating.Good, genres: [Genres.Horror]))
        products.append(Product(title: "Uncharted", description: "Uncharted 4: A Thief's End is the sequel to 2011's Uncharted 3: Drake's Deception, it is the conclusion to the Uncharted series starring Nathan Drake, and the last game in the franchise to be developed by Naughty Dog.",imageName: "Uncharted4.jpg", year: 2016, rating: ProductRating.Outstanding, genres: [Genres.Action, Genres.Adventure]))
        
        products.append(Product(title: "No Man's Sky", description: "The gameplay of No Man's Sky is built on four pillars: exploration, survival, combat, and trading. Players are free to perform within the entirety of a procedurally generated deterministic open universe, which includes over 18 quintillion (1.8×1019) planets, many with their own sets of flora and fauna. Players participate in a shared universe, with the ability to exchange planet information with other players, though the game is also fully playable offline; this is enabled by the procedural generation system that assures players find the same planet with the same features, lifeforms, and other aspects once given the planet coordinates, requiring no further data to be stored or retrieved from game servers. Nearly all elements of the game are procedurally generated, including star systems, planets and their ecosystems, flora, fauna and their behavioural patterns, artificial structures, and alien factions and their spacecraft.",imageName: "NoMansSky.jpg", year: 2016, rating: ProductRating.Excellent, genres: [Genres.Adventure]))
        return ProductLine(productType: "Video Games", includedProducts: products)
    }
    
    private class func books () -> ProductLine
    {
        var products = [Product]()
        products.append(Product(title: "No Book", description: "Sorry Can't Compile ",imageName: "", year: 0, rating: ProductRating.Unrated, genres: [Genres.None]))
        return ProductLine(productType: "Books", includedProducts: products)
    }
    
    private class func tvSeries () -> ProductLine
    {
        var products = [Product]()
        products.append(Product(title: "No TV Series", description: "Sorry Can't Compile ",imageName: "", year: 0, rating: ProductRating.Unrated, genres: [Genres.None]))
        return ProductLine(productType: "TV Series", includedProducts: products)
    }
    
    private class func music () -> ProductLine
    {
        var products = [Product]()
        products.append(Product(title: "No Music", description: "Sorry Can't Compile ",imageName: "", year: 0, rating: ProductRating.Unrated, genres: [Genres.None]))
        return ProductLine(productType: "Music", includedProducts: products)
    }
    
}