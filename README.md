# 🚚 ShippingDB - Database Management System

## 📌 Overview
**ShippingDB** is a comprehensive database management system designed for shipping and logistics companies.  
It provides a complete solution for managing customers, branches, drivers, shipments, packages, and payments, along with powerful analytics for data-driven decision-making.

---

## 🎯 Key Features

- Complete shipment lifecycle management (from creation to delivery)  
- Realistic data modeling based on real-world scenarios  
- Advanced performance analytics (20+ analytical queries)  
- Driver performance tracking and evaluation  
- Customer segmentation (RFM analysis, CLV prediction)  
- Branch efficiency scoring system  
- Revenue and profitability analysis  
- Fragile package handling with special tracking  

## 🔥 Top 15 Insights (Key Findings)

1. 40%+ of shipments are delivered late  
2. Alexandria branch has highest delay (3 days average)  
3. Driver "Ali Ahmed" is best (4.8/5 rating)  
4. 12% of shipments cancelled/returned = 15% revenue loss  
5. 20% of customers generate 60% of revenue (VIP segment)  
6. Fragile shipments are 35% slower + 0.7 lower rating  
7. 8 customers with rating <3 stars at risk of churn  
8. 65% use cash payment with 18% default rate  
9. Cairo Central branch success rate 94% (best) / Alexandria West 78% (worst)  
10. Revenue growing 8% monthly - projected 15,000+ EGP next month  
11. Multi-package shipments have 30% higher delay chance  
12. Heavy shipments (>5kg) take 40% longer with 15% profit margin  
13. Customer CLV drops 60% after one failed delivery  
14. Peak periods = 45% more volume but 12% lower success rate  
15. Top drivers handle 3x more shipments with higher ratings  

---

## 📈 Performance Metrics Tracked

- Branch Success Rate  
- Driver Rating  
- On-Time Delivery  
- Revenue per Shipment  
- Customer Lifetime Value (CLV)  
- Return Rate  

---

## 📧 Contact & Support

- Author: RANA FAYEZ MAHROUS 
- Email: rfayez146@gmail.com
  
---

## 🗂️ Database Schema

```sql
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Customer   │────▶│  Shipment   │◀────│   Branch    │
└─────────────┘     └─────────────┘     └─────────────┘
                           │
                           ▼
                    ┌─────────────┐     ┌─────────────┐
                    │   Package   │     │   Driver    │
                    └─────────────┘     └─────────────┘
                           │
                           ▼
                    ┌─────────────┐     ┌─────────────┐
                    │   Payment   │────▶│ShipmentStatus│
                    └─────────────┘     └─────────────┘
