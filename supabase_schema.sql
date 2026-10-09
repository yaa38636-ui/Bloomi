create table if not exists public.products (
  id text primary key,
  name text not null,
  price numeric not null default 0,
  rating numeric not null default 4.8,
  image text,
  category text default 'Semua',
  description text default ''
);

create table if not exists public.cart (
  id text primary key,
  product_id text not null,
  product_name text not null,
  price numeric not null default 0,
  quantity integer not null default 1,
  image text,
  variant text default 'Default'
);

alter table public.products enable row level security;
alter table public.cart enable row level security;

create policy "products_public_read" on public.products
for select using (true);

create policy "cart_public_read" on public.cart
for select using (true);

create policy "cart_public_insert" on public.cart
for insert with check (true);

create policy "cart_public_update" on public.cart
for update using (true);

create policy "cart_public_delete" on public.cart
for delete using (true);

insert into public.products(id,name,price,rating,category,description) values
('1','Cloudy Tote Bag',89000,4.9,'Fashion','Tas minimalis untuk aktivitas harian.'),
('2','Aero Wireless Earbuds',199000,4.8,'Elektronik','Earbuds ringan dengan suara jernih.'),
('3','Daily Planner Pastel',59000,4.9,'Hobi & Alat Tulis','Planner simpel untuk jadwal harian.'),
('4','Bloom Sneakers',249000,4.7,'Sepatu & Sneakers','Sneakers nyaman untuk aktivitas sehari-hari.')
on conflict (id) do nothing;
