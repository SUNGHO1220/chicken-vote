-- 2-1반 닭강정 맛 투표 테이블 (Supabase SQL Editor에 붙여 넣고 Run)
create table if not exists public.chicken_votes (
  student_no int primary key check (student_no between 1 and 40),
  flavor     text not null check (flavor in ('spicy','soy','cheese','fried')),
  voted_at   timestamptz not null default now()
);

alter table public.chicken_votes enable row level security;

-- 학생(익명)이 투표하고, 다시 투표하면 바꾸고, 결과를 볼 수 있게 허용
create policy "anyone can read votes"   on public.chicken_votes for select to anon using (true);
create policy "anyone can vote"         on public.chicken_votes for insert to anon with check (true);
create policy "anyone can change vote"  on public.chicken_votes for update to anon using (true) with check (true);
