module RecordsHelper
  def show_score record
    if record
      record.score
    else
      'No Play'
    end
  end
  
  def show_rank record
    if record.blank?
      return '--'
    end
    
    notes = record.song.notes
    score = record.score
    border = {
      'MAX' => notes*2,
      'MAX-' => (notes.to_f*17/9).ceil,
      'AAA' => (notes.to_f*16/9).ceil,
      'AAA-' => (notes.to_f*15/9).ceil,
      'AA' => (notes.to_f*14/9).ceil,
      'AA-' => (notes.to_f*13/9).ceil,
      'A' => (notes.to_f*12/9).ceil,
      'A-' => (notes.to_f*12/9).ceil,
      'B' => (notes.to_f*10/9).ceil,
      'B-' => (notes.to_f*9/9).ceil,
      'C' => (notes.to_f*8/9).ceil,
      'C-' => (notes.to_f*7/9).ceil,
      'D' => (notes.to_f*6/9).ceil,
      'D-' => (notes.to_f*5/9).ceil,
      'E' => (notes.to_f*4/9).ceil,
      'E-' => (notes.to_f*3/9).ceil,
    }
    
    if score >= border['AAA']
      'AAA'
    elsif score >= border['AA']
      'AA'
    elsif score >= border['A']
      'A'
    elsif score >= border['B']
      'B'      
    elsif score >= border['C']
      'C'
    elsif score >= border['D']
      'D'
    elsif score >= border['E']
      'E'
    else
      'F'
    end
  end
  
  def show_valuation record
    if record.blank?
      return '--'
    end
    
    notes = record.song.notes
    score = record.score
    border = {
      'MAX' => notes*2,
      'MAX-' => (notes.to_f*17/9).ceil,
      'AAA' => (notes.to_f*16/9).ceil,
      'AAA-' => (notes.to_f*15/9).ceil,
      'AA' => (notes.to_f*14/9).ceil,
      'AA-' => (notes.to_f*13/9).ceil,
      'A' => (notes.to_f*12/9).ceil,
      'A-' => (notes.to_f*12/9).ceil,
      'B' => (notes.to_f*10/9).ceil,
      'B-' => (notes.to_f*9/9).ceil,
      'C' => (notes.to_f*8/9).ceil,
      'C-' => (notes.to_f*7/9).ceil,
      'D' => (notes.to_f*6/9).ceil,
      'D-' => (notes.to_f*5/9).ceil,
      'E' => (notes.to_f*4/9).ceil,
      'E-' => (notes.to_f*3/9).ceil,
    }
    if score >= border['MAX-']
      'MAX-' + (border['MAX']-score).to_s
    elsif score >= border['AAA']
      'AAA+' + (score - border['AAA']).to_s
    elsif score >= border['AAA-']
      'AAA-' + (border['AAA']-score).to_s
    elsif score >= border['AA']
      'AA+' + (score - border['AA']).to_s
    elsif score >= border['AA-']
      'AA-' + (border['AA']-score).to_s
    elsif score >= border['A']
      'A+' + (score - border['A']).to_s
    elsif score >= border['A-']
      'A-' + (border['A']-score).to_s
    elsif score >= border['B']
      'B+' + (score - border['B']).to_s
    elsif score >= border['B-']
      'B-' + (border['B']-score).to_s
    elsif score >= border['C']
      'C+' + (score - border['C']).to_s
    elsif score >= border['C-']
      'C-' + (border['C']-score).to_s
    elsif score >= border['D']
      'D+' + (score - border['D']).to_s
    elsif score >= border['D-']
      'D-' + (border['D']-score).to_s
    elsif score >= border['E']
      'E+' + (score - border['E']).to_s
    else
      'E-' + (border['E']-score).to_s
    end
  end
  
  def show_rate record
    if record.blank?
      return '--'
    end
    notes = record.song.notes
    score = record.score
    rate = score.to_f / (notes*2).to_f * 100
    number_to_percentage(rate, :precision => 2) 
  end
end
