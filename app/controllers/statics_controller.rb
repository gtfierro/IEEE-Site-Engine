class StaticsController < ApplicationController
  
  def about
  end

  def officers
    @execs = [['Tianbo Xu', 'Chair'], ['Pranava Adduri', 'External VP'], ['Mark Hettick', 'Internal VP'], ['Gabe Fierro', 'Secretary'], ['Jeff Tsui', 'Treasurer']]
    @activities = ['Leland Au', 'Alice Lee', 'Amanda Ren', 'Annie Shin', 'Edward Wu']
    @hope = ['Sean Soleyman', 'Oliver Zhu', 'Andrew Wun']
    @indrel = ['Mihir Joshi', 'Benjamin Lui', 'Noel Moldvai', 'Mano Pagalavan', 'Alok Rai', 'Amudhan Venkatesan']
    @io = ['Jaclyn Louie', 'Navin Eluthesen', 'Ayushi Samaddar', 'Jessika Wu', 'Muller Zhang']
    @prodev = ['Owen Lin', 'Deirdre Chen', 'Aime Ngongang', 'Jeremy Williams']
    @techops = ['Felix Wong', 'Guillaume Bellegarda', 'Sergio Hidalgo', 'Jonathan Hsu', 'William Ku', 'Sam Whitlock']
    @website = ['Kristine Chen', 'Jian P. Chen', 'Stephanie Chou', 'Yuval Gnessin', 'Kevin Sheng', 'David Su']
  end

  def hope
  end

  def scope
  end

  def indrel
  end

end
