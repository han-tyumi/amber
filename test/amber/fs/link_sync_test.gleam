import amber
import amber/error
import gleeunit/should
import gossamer/text_encoder

pub fn link_sync_success_test() {
  let assert Ok(test_dir) = amber.make_temp_dir_sync()
  let old_data = "hardlink"
  let old_name = test_dir <> "/oldname"
  let new_name = test_dir <> "/newname"

  let assert Ok(_) =
    amber.write_file_sync(old_name, text_encoder.encode(old_data))

  // Create the hard link.
  let _ = amber.link_sync(old_name, new_name)

  // We should expect reading the same content.
  let assert Ok(new_data) = amber.read_text_file_sync(new_name)
  should.equal(old_data, new_data)

  // Writing to newname also affects oldname.
  let new_data2 = "modified"
  let assert Ok(_) =
    amber.write_file_sync(new_name, text_encoder.encode(new_data2))
  let assert Ok(old_name_content) = amber.read_text_file_sync(old_name)
  should.equal(new_data2, old_name_content)

  // Writing to oldname also affects newname.
  let new_data3 = "modified_again"
  let assert Ok(_) =
    amber.write_file_sync(old_name, text_encoder.encode(new_data3))
  let assert Ok(new_name_content) = amber.read_text_file_sync(new_name)
  should.equal(new_data3, new_name_content)

  // Remove oldname. File still accessible through newname.
  let assert Ok(_) = amber.remove_sync(old_name)
  let assert Ok(new_name_stat) = amber.stat_sync(new_name)
  should.be_true(new_name_stat.is_file)
  should.be_true(!new_name_stat.is_symlink)

  // Not a symlink.
  let assert Ok(new_name_content) = amber.read_text_file_sync(new_name)
  should.equal(new_data3, new_name_content)
}

pub fn link_sync_exists_test() {
  let assert Ok(test_dir) = amber.make_temp_dir_sync()
  let old_name = test_dir <> "/oldname"
  let new_name = test_dir <> "/newname"

  let assert Ok(_) =
    amber.write_file_sync(old_name, text_encoder.encode("old_name"))

  // newname is already created.
  let assert Ok(_) =
    amber.write_file_sync(new_name, text_encoder.encode("new_name"))

  amber.link_sync(old_name, new_name)
  |> should.equal(Error(error.AlreadyExists))
}

pub fn link_sync_not_found_test() {
  let assert Ok(test_dir) = amber.make_temp_dir_sync()
  let old_name = test_dir <> "/oldname"
  let new_name = test_dir <> "/newname"

  amber.link_sync(old_name, new_name)
  |> should.equal(Error(error.NotFound))
}
// TODO(@han-tyumi): Investigate incorporating perm tests.
// pub fn link_sync_read_perm_test() {
//   amber.link_sync("oldbaddir", "newbaddir")
//   |> should.equal(Error(error.NotCapable))
// }
// pub fn link_sync_write_perm_test() {
//   amber.link_sync("oldbaddir", "newbaddir")
//   |> should.equal(Error(error.NotCapable))
// }
