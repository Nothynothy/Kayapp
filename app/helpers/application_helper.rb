module ApplicationHelper
  def int_to_roman(int)
    { 1 => 'I',
      2 => 'II',
      3 => 'III',
      4 => 'IV',
      5 => 'V',
      6 => 'VI' }[int]
  end

  def rom_to_int(rom)
    { 'I' => 1,
      'II' => 2,
      'III' => 3,
      'IV' => 4,
      'V' => 5,
      'VI' => 6 }[rom]
  end
end
