import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

export interface PlatformPrice {
  platform: string;
  color: string;
  price: number;
  originalPrice?: number;
  isBest: boolean;
}

export interface FeaturedProduct {
  id: string;
  name: string;
  meta: string;
  tag: 'popular' | 'deal';
  fastestDelivery: string;
  prices: PlatformPrice[];
}

export interface Deal {
  name: string;
  platform: string;
  platformColor: string;
  discount: number;
  price: number;
  originalPrice: number;
}

export interface TickerItem {
  emoji: string;
  product: string;
  oldPrice: number;
  newPrice: number;
  platform: string;
}

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, RouterModule, FormsModule],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  searchQuery = '';

  suggestions = [
    { emoji: '🥛', label: 'Amul Milk' },
    { emoji: '🧅', label: 'Onions' },
    { emoji: '🍅', label: 'Tomatoes' },
    { emoji: '🥚', label: 'Eggs' },
    { emoji: '🌾', label: 'Aashirvaad Atta' },
    { emoji: '🫒', label: 'Fortune Oil' },
  ];

  stats = [
    { value: '₹18K+', label: 'Avg. savings per family / year' },
    { value: '6+',    label: 'Platforms compared' },
    { value: '50K+',  label: 'Products tracked' },
    { value: '10min', label: 'Price refresh interval' },
  ];

  platforms = [
    { name: 'Blinkit',           color: '#F59E0B' },
    { name: 'Zepto',             color: '#8B5CF6' },
    { name: 'BigBasket',         color: '#10B981' },
    { name: 'JioMart',           color: '#3B82F6' },
    { name: 'Swiggy Instamart',  color: '#EF4444' },
    { name: 'Amazon Fresh',      color: '#F97316' },
  ];

  tickerItems: TickerItem[] = [
    { emoji: '🥦', product: 'Broccoli',           oldPrice: 65,  newPrice: 52, platform: 'Zepto' },
    { emoji: '🍅', product: 'Tomatoes',            oldPrice: 40,  newPrice: 32, platform: 'Blinkit' },
    { emoji: '🥛', product: 'Amul Milk 1L',        oldPrice: 68,  newPrice: 62, platform: 'BigBasket' },
    { emoji: '🧅', product: 'Onions 1kg',          oldPrice: 45,  newPrice: 36, platform: 'JioMart' },
    { emoji: '🍌', product: 'Bananas 12pc',        oldPrice: 55,  newPrice: 44, platform: 'Swiggy Instamart' },
    { emoji: '🥚', product: 'Eggs (12 pack)',      oldPrice: 96,  newPrice: 84, platform: 'Zepto' },
  ];

  featuredProducts: FeaturedProduct[] = [
    {
      id: 'amul-milk-1l',
      name: 'Amul Taaza Full Cream Milk',
      meta: '1 Litre Tetra Pack',
      tag: 'popular',
      fastestDelivery: 'Blinkit · 9 min',
      prices: [
        { platform: 'BigBasket', color: '#10B981', price: 62, isBest: true },
        { platform: 'Blinkit',   color: '#F59E0B', price: 65, originalPrice: 68, isBest: false },
        { platform: 'Zepto',     color: '#8B5CF6', price: 66, isBest: false },
      ]
    },
    {
      id: 'aashirvaad-atta-5kg',
      name: 'Aashirvaad Whole Wheat Atta',
      meta: '5 kg',
      tag: 'deal',
      fastestDelivery: 'BigBasket · 2 hrs',
      prices: [
        { platform: 'JioMart',      color: '#3B82F6', price: 268, isBest: true },
        { platform: 'Amazon Fresh', color: '#F97316', price: 285, originalPrice: 320, isBest: false },
        { platform: 'BigBasket',    color: '#10B981', price: 295, isBest: false },
      ]
    },
    {
      id: 'eggs-12pack',
      name: 'Farm Fresh Eggs',
      meta: 'Pack of 12',
      tag: 'popular',
      fastestDelivery: 'Zepto · 11 min',
      prices: [
        { platform: 'Zepto',            color: '#8B5CF6', price: 84, isBest: true },
        { platform: 'Swiggy Instamart', color: '#EF4444', price: 89, isBest: false },
        { platform: 'Blinkit',          color: '#F59E0B', price: 92, originalPrice: 96, isBest: false },
      ]
    },
    {
      id: 'fortune-oil-1l',
      name: 'Fortune Sunflower Oil',
      meta: '1 Litre Bottle',
      tag: 'deal',
      fastestDelivery: 'Blinkit · 8 min',
      prices: [
        { platform: 'BigBasket', color: '#10B981', price: 138, isBest: true },
        { platform: 'JioMart',   color: '#3B82F6', price: 142, isBest: false },
        { platform: 'Blinkit',   color: '#F59E0B', price: 149, originalPrice: 160, isBest: false },
      ]
    },
  ];

  deals: Deal[] = [
    { name: "Lay's Classic Salted Chips 26g", platform: 'Zepto',        platformColor: '#8B5CF6', discount: 22, price: 10,  originalPrice: 13  },
    { name: 'Tata Salt 1kg',                  platform: 'JioMart',      platformColor: '#3B82F6', discount: 18, price: 22,  originalPrice: 27  },
    { name: 'Britannia Good Day Biscuits',    platform: 'BigBasket',    platformColor: '#10B981', discount: 15, price: 34,  originalPrice: 40  },
    { name: 'Real Fruit Juice Mixed Fruit 1L',platform: 'Amazon Fresh', platformColor: '#F97316', discount: 30, price: 84,  originalPrice: 120 },
  ];

  constructor(private router: Router) {}

  ngOnInit(): void {}

  onSearch(): void {
    if (this.searchQuery.trim()) {
      this.router.navigate(['/search'], {
        queryParams: { q: this.searchQuery.trim() }
      });
    }
  }

  onSuggestionClick(label: string): void {
    this.searchQuery = label;
    this.onSearch();
  }

  onCompare(productId: string): void {
    this.router.navigate(['/compare', productId]);
  }

  getSaving(item: TickerItem): number {
    return item.oldPrice - item.newPrice;
  }
}
