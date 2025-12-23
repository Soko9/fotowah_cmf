# fotowah_cmf
System App for Fotowat Al Aqsa

## Sections
1. حلقات القرآن
2. رائدات
3. Smart Academy  
4. رياضة
5. كشاف
6. القسم الاجتماعي
7. القسم الدعوي
8. قسم العلاقات

## DATA
### users
| KEY           | TYPE     |
|---------------|----------|
| id            | uuid     |
| full_name     | text     |
| gender        | bit      |
| date_of_birth | datetime |
| phone         | text     |
| created_at    | datetime |

### roles
| KEY                                              | TYPE |
|--------------------------------------------------|------|
| id                                               | uuid |
| name (admin, supervisor, volunteer, kid, parent) | text |

### user_roles
| KEY     | TYPE |
|---------|------|
| user_id | uuid |
| role_id | uuid |

### sections
| KEY         | TYPE |
|-------------|------|
| id          | uuid |
| name        | text |
| description | text |

### activities
| KEY        | TYPE     |
|------------|----------|
| id         | uuid     |
| section_id | uuid     |
| name       | text     |
| section_id | uuid     |
| datetime   | datetime |
| place      | text     |

### activity_members
| KEY              | TYPE     |
|------------------|----------|
| activity_id      | uuid     |
| user_id          | uuid     |
| role_in_activity | uuid     |
| joined_at        | datetime |

### sessions
| KEY         | TYPE     |
|-------------|----------|
| id          | uuid     |
| activity_id | uuid     |
| date        | datetime |
| topic       | text     |
| notes       | text     |

### attendance
| KEY                               | TYPE |
|-----------------------------------|------|
| session_id                        | uuid | 
| user_id                           | uuid |
| status (present, absent, excused) | text |

### progress
| KEY         | TYPE     |
|-------------|----------|
| user_id     | uuid     |
| activity_id | uuid     |
| score       | int      |
| notes       | text     |
| updated_at  | datetime |

### additional data
- monthly_attendance_view
- annual_progress_view
- section_growth_view
