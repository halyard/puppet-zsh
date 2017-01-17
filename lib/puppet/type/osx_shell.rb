Puppet::Type.newtype(:osx_shell) do
  @doc = "Set shell for user"

  newparam :user do
    desc "The user whose shell is to be changed"
    isnamevar
  end

  newproperty :shell do
    desc "The full path to the shell"
  end
end
