SELECT
    type,
    CASE
        WHEN adm1 IN (
            'Aden', 'Abyan', 'Al Mahrah',
            'Hadramawt', 'Lahij', 'Shabwah'
        ) THEN 'PDRY'
        WHEN adm1 IN (
            'Al Bayda''', 'Sana''a', 'Al Dali''',
            'Al Hudaydah', 'Al Jawf', 'Al Mahwit',
            'Amanat Al Asimah', 'Amran', 'Dhamar',
            'Hajjah', 'Ibb', 'Ma''rib', 'Raymah',
            'Sa''dah', 'Ta''izz'
        ) THEN 'YAR'
    END AS former_country,
    CAST(SUM(population) AS INTEGER) AS population
FROM yemen_2020
WHERE type IN ('elderly_60_plus', 'youth_15_24')
  AND adm1 IN (
      'Al Bayda''', 'Sana''a', 'Al Dali''',
      'Al Hudaydah', 'Al Jawf', 'Al Mahwit',
      'Amanat Al Asimah', 'Amran', 'Dhamar',
      'Hajjah', 'Ibb', 'Ma''rib', 'Raymah',
      'Sa''dah', 'Ta''izz',
      'Aden', 'Abyan', 'Al Mahrah',
      'Hadramawt', 'Lahij', 'Shabwah'
  )
GROUP BY
    type,
    CASE
        WHEN adm1 IN (
            'Aden', 'Abyan', 'Al Mahrah',
            'Hadramawt', 'Lahij', 'Shabwah'
        ) THEN 'PDRY'
        WHEN adm1 IN (
            'Al Bayda''', 'Sana''a', 'Al Dali''',
            'Al Hudaydah', 'Al Jawf', 'Al Mahwit',
            'Amanat Al Asimah', 'Amran', 'Dhamar',
            'Hajjah', 'Ibb', 'Ma''rib', 'Raymah',
            'Sa''dah', 'Ta''izz'
        ) THEN 'YAR'
    END
ORDER BY
    type ASC,
    former_country ASC;
