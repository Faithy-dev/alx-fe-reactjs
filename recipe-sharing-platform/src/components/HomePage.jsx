import React from "react";
import { Link } from "react-router-dom";
import data from "../data.json"; // your recipes data

function HomePage() {
  return (
    <div className="container mx-auto p-6">
      <h1 className="text-4xl font-bold mb-8 text-center">Delicious Recipes</h1>
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        {data.map((recipe) => (
          <div
            key={recipe.id}
            className="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 overflow-hidden"
          >
            <img
              src={recipe.image}
              alt={recipe.name}
              className="w-full h-48 object-cover"
            />
            <div className="p-4">
              <h2 className="text-2xl font-semibold mb-2">{recipe.name}</h2>
              <p className="text-gray-600 mb-4">{recipe.description}</p>
              <Link
                to={`/recipe/${recipe.id}`}
                className="inline-block px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition-colors"
              >
                View Recipe
              </Link>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export default HomePage;
