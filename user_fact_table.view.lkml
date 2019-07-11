view: user_fact_table {
  derived_table: {
    sql: SELECT
      --   DATE(CONVERT_TZ(orders.created_at ,'UTC','America/New_York')) AS `orders.created_date`,
        orders.status  AS `status_of_order`,
      --   COUNT(DISTINCT orders.id )  AS `Num_of_Order`,
        orders.user_id  AS `orders.user_id`,
        order_items.inventory_item_id  AS `order_items.inventory_item_id`,
        order_items.id  AS `order_items.id`,
        order_items.order_id  AS `order_items.order_id`,
      --   order_items.sale_price  AS `Total_Spend`,
        products.brand  AS `products.brand`,
        products.category  AS `products.category`,
        products.id  AS `products.id`,
        products.item_name  AS `products.item_name`,
        CASE WHEN products.department = 'Men'  THEN 'Yes' ELSE 'No' END
       AS `products.is_male`,
      --   SUM(retail_price)  AS `retail_price`,
        users.age  AS `users.age`,
        users.country  AS `users.country`,
        users.first_name  AS `users.first_name`,
        users.id  AS `users.id`,
        users.state  AS `users.state`,
        inventory_items.cost  AS `Item_Cost`,
        inventory_items.product_id  AS `inventory_items.product_id`,
        -- DATE(CONVERT_TZ(orders.created_at ,'UTC','America/New_York')) AS `orders_created_date`,
        -- DATE(CONVERT_TZ(inventory_items.sold_at ,'UTC','America/New_York')) AS `sold_date`,
        users.city  AS `users.city`,
        users.zip  AS `users.zip`,
        min(DATE(CONVERT_TZ(orders.created_at ,'UTC','America/New_York'))) AS `firts_order_date`,
        max(DATE(CONVERT_TZ(inventory_items.sold_at ,'UTC','America/New_York'))) AS `sold_date`,
        SUM(retail_price)  AS `total_retail_spent`,
        SUM(sale_price)  AS `total_sale_price`,
        COUNT(DISTINCT orders.id ) AS `number_of_order`,
        COUNT(*) AS `order_items.count`,
        COUNT(DISTINCT products.id ) AS `products.count`,
        COUNT(DISTINCT users.id ) AS `count_of_user`,
        COUNT(DISTINCT inventory_items.id ) AS `inventory_items.count`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN demo_db.products  AS products ON inventory_items.product_id = products.id
      LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id

      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
      ORDER BY DATE(CONVERT_TZ(orders.created_at ,'UTC','America/New_York')) DESC
      LIMIT 500
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: status_of_order {
    type: string
    sql: ${TABLE}.status_of_order ;;
  }

  dimension: orders_user_id {
    type: number
    sql: ${TABLE}.`orders.user_id` ;;
  }

  dimension: order_items_inventory_item_id {
    type: number
    sql: ${TABLE}.`order_items.inventory_item_id` ;;
  }

  dimension: order_items_id {
    type: number
    sql: ${TABLE}.`order_items.id` ;;
  }

  dimension: order_items_order_id {
    type: number
    sql: ${TABLE}.`order_items.order_id` ;;
  }

  dimension: products_brand {
    type: string
    sql: ${TABLE}.`products.brand` ;;
  }

  dimension: products_category {
    type: string
    sql: ${TABLE}.`products.category` ;;
  }

  dimension: products_id {
    type: number
    sql: ${TABLE}.`products.id` ;;
  }

  dimension: products_item_name {
    type: string
    sql: ${TABLE}.`products.item_name` ;;
  }

  dimension: products_is_male {
    type: string
    sql: ${TABLE}.`products.is_male` ;;
  }

  dimension: users_age {
    type: number
    sql: ${TABLE}.`users.age` ;;
  }

  dimension: users_country {
    type: string
    sql: ${TABLE}.`users.country` ;;
  }

  dimension: users_first_name {
    type: string
    sql: ${TABLE}.`users.first_name` ;;
  }

  dimension: users_id {
    type: number
    sql: ${TABLE}.`users.id` ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }

  dimension: item_cost {
    type: number
    sql: ${TABLE}.Item_Cost ;;
  }

  dimension: inventory_items_product_id {
    type: number
    sql: ${TABLE}.`inventory_items.product_id` ;;
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.`users.city` ;;
  }

  dimension: users_zip {
    type: number
    sql: ${TABLE}.`users.zip` ;;
  }

  dimension: firts_order_date {
    type: date
    sql: ${TABLE}.firts_order_date ;;
  }

  dimension: sold_date {
    type: date
    sql: ${TABLE}.sold_date ;;
  }

  dimension: total_retail_spent {
    type: number
    sql: ${TABLE}.total_retail_spent ;;
  }

  dimension: total_sale_price {
    type: number
    sql: ${TABLE}.total_sale_price ;;
  }

  dimension: number_of_order {
    type: number
    sql: ${TABLE}.number_of_order ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.`order_items.count` ;;
  }

  dimension: products_count {
    type: number
    sql: ${TABLE}.`products.count` ;;
  }

  dimension: count_of_user {
    type: number
    sql: ${TABLE}.count_of_user ;;
  }

  dimension: inventory_items_count {
    type: number
    sql: ${TABLE}.`inventory_items.count` ;;
  }

  set: detail {
    fields: [
      status_of_order,
      orders_user_id,
      order_items_inventory_item_id,
      order_items_id,
      order_items_order_id,
      products_brand,
      products_category,
      products_id,
      products_item_name,
      products_is_male,
      users_age,
      users_country,
      users_first_name,
      users_id,
      users_state,
      item_cost,
      inventory_items_product_id,
      users_city,
      users_zip,
      firts_order_date,
      sold_date,
      total_retail_spent,
      total_sale_price,
      number_of_order,
      order_items_count,
      products_count,
      count_of_user,
      inventory_items_count
    ]
  }
}
